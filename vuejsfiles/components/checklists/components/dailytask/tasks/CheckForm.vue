<template>
    <div>
        <div class="modal-header">
            <button type="button" class="close" @click="closeform"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="ajaxModalTitle" data-title="PRO-KAZI">Daily Ict Checklist Tasks</h4>
        </div>
        <div class="row" style="width: 90%;margin: auto; text-align: left" v-if="loadedprevious">
            <div class="content-area" v-if="loadedchecks">
                <div class="row">
                    <div class="col-md-12">
                        <table style="margin-bottom: 10px;">
                            <thead>
                            <td>#</td>
                            <td style="width: 300px; word-wrap: break-word">Item</td>
                            <td>Yes</td>
                            <td style="width: 70px; word-wrap: break-word;text-align: center">Pending/Error/No</td>
                            <td>Comment</td>
                            </thead>
                            <tbody>
                            <tr v-for="(check, key) in checklistitems">
                                <td>{{key}}</td>
                                <td><b>{{check.name}}</b> - {{check.comment}}</td>
                                <td>
                                    <input type="radio"
                                           v-model="items_form.check[key]"
                                           :value=yes_val(check)
                                           :name="radioname(check)"/>
                                </td>
                                <td style="text-align: center">
                                    <input type="radio"
                                           v-model="items_form.check[key]"
                                           :value=no_val(check)
                                           :name="radioname(check)"/>
                                </td>
                                <td>
                                    <input v-model="items_form.comment[key]" type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td  colspan="4">
                                    <div v-if="showescalate">
                                        <v-select :options="users" v-model="items_form.escalate_to" placeholder="Escalate task to"></v-select>
                                    </div>
                                </td>
                                <td style="text-align: center">
                                    <button :disabled="submitted" type="submit" @click="submitform" class="btn btn-primary pull-right"><span
                                            class="fa fa-check-circle"></span>
                                        {{(submitted)?'Please wait...':'Submit'}}
                                    </button>

                                </td>
                            </tr>
                            </tbody>
                        </table>


                    </div>

                </div>
            </div>
        </div>
    </div>
</template>
<script>
   import vSelect from 'vue-select';
    export default {
        data: () => ({
            items_form: {
                check: [], //set for update purposes
                comment: [], //set for update purposes
                checkitems: [],
                escalate_to:''
            },
            users:[],
            checklistitems: [],
            submitted: false,
            loadedchecks: false,
            loadedprevious:false,

        }),
        computed:{
            showescalate(){
                let showesc = false;
                this.items_form.check.forEach((data)=>{
                    if(data.split('_')[0] === 'no'){
                        showesc = true;
                    }
                });
                return showesc;
            }
        },
        methods: {
            yes_val(data) {
                return "yes_" + data.id;
            },
            no_val(data) {
                return "no_" + data.id;
            },
            radioname(data) {
                return "radio_" + data.id;
            },
            closeform() {
                this.$modal.hide('ict-task-form');
            },
            submitform() {
                this.saveData();
            },
            saveData() {
                if (this.checklistitems.length === this.items_form.check.length) {
                    this.submitdata();
                } else {
                    alert("You must check eithe yes or no on each item before submitting");
                }
            },
            submitdata(){
                this.submitted = true;
                this.$http.post('checklist_daily_tasks/savetasks', this.items_form)
                    .then((res) => {
                        this.submitted = false;
                        this.closeform();
                    }, (res) => {
                        this.submitted = false;
                        this.closeform();
                    });
            },

            getIctUsers(){
                this.$http.get('checklists/ict_users')
                    .then((res)=>{
                        res.body.forEach((data)=>{
                            this.users.push({label:data.first_name, value:data.id});

                        });
                    })

            },

            getIctChecklists() {
                this.loadedchecks = false;
                this.$http.get('checklists/list_checklists/1')
                    .then((res) => {
                        this.checklistitems = res.body.data;
                        this.items_form.checkitems = res.body.data;
                        this.loadedchecks = true;
                        this.loadedprevious = true;

                    }, (err) => {
                        this.loadedchecks = true;
                    })
            },
        },
        components: {
            vSelect
        },
        mounted() {
            this.getIctChecklists();
            this.getIctUsers();
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

    thead td {
        font-weight: bolder;
    }

    td {
        padding: 10px;
    }
</style>