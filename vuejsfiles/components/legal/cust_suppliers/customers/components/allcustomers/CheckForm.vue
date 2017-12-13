<template>
    <div>
        <div class="modal-header">
            <button type="button" class="close" @click="closeform"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="ajaxModalTitle" data-title="PRO-KAZI">Perform Checks</h4>
        </div>
        <div class="row" style="width: 90%;margin: auto; text-align: left">
            <div class="content-area" v-if="loadedchecks">
                <div class="row">
                    <table>
                        <thead>
                        <td>#</td>
                        <td>ChecklistItem</td>
                        <td>Yes</td>
                        <td>No</td>
                        <td>Comment</td>
                        <td>Expiry Date</td>
                        </thead>
                        <tbody>
                        <tr v-for="(check, key) in checklistitems ">
                            <td>{{key}}</td>
                            <td>{{check.name}}</td>
                            <td>
                                <input type="radio"
                                       v-model="items_form.check[key]"
                                       :value=yes_val(check)
                                       :name="radioname(check)"/>
                            </td>
                            <td>
                                <input type="radio"
                                       v-model="items_form.check[key]"
                                       :value=no_val(check)
                                       :name="radioname(check)"/>
                            </td>
                            <td>
                                <input v-model="items_form.comment[key]" type="text"/>
                            </td>
                            <td>
                                <datepicker  v-model="items_form.date_expiry[key]" ></datepicker>
                            </td>
                        </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>


        <div class="row" style="margin-top: 20px;">
            <div class="modal-footer">
                <button :disabled="submitted" type="submit" @click="submitform" class="btn btn-primary"><span
                        class="fa fa-check-circle"></span>
                    {{(submitted)?'Please wait...':'Submit'}}
                </button>
            </div>
        </div>


    </div>
</template>
<script>
    import Datepicker from 'vuejs-datepicker';
    export default {
        data: () => ({
            items_form: {
                check: [], //set for update purposes
                comment: [], //set for update purposes
                date_expiry: [], //set for update purposes,
                cust_supp_id:localStorage.getItem('customer'),
                checkitems:[]

            },
            checklistitems: [],
            submitted: false,
            loadedchecks: false
        }),
        methods: {
            yes_val(data){
                return "yes_"+data.id;

            },
            no_val(data){
                return "no_"+data.id;
            },
            radioname(data){
              return "radio_"+data.id;
            },
            closeform() {
                this.$modal.hide('customer_checks');
            },
            submitform() {
                this.saveData();
            },
            saveData() {
                this.submitted = true;
                this.$http.post('checkitems/savecustsuppchecks/1', this.items_form)
                    .then((res) => {
                        this.submitted = false;
                        this.closeform();
                    }, (res) => {
                        this.submitted = false;
                        this.closeform();
                    });
            },

            getCustomersChecklists() {
                this.loadedchecks = false;
                this.$http.get('checkitems/getCust_suppChecks/1')
                    .then((res) => {
                        this.checklistitems = res.body;
                        this.items_form.checkitems = res.body;
                        this.loadedchecks = true;
                        console.log(this.checklistitems[0]);
                    }, (err) => {
                        this.loadedchecks = true;
                    })


            }
        },
        components:{
            Datepicker
        },
        mounted() {
            this.getCustomersChecklists();
        },

    }
</script>
<style>
    .modal-footer {
        position: absolute;
        bottom: 0;
        right: 0;
        margin-top: 12px;
    }

    .content-area {
        width: 90%;
        margin: auto;
    }

    thead td{
        font-weight: bolder;
    }
    td{
        padding: 10px;
    }
</style>