<template>
    <div>
        <div class="modal-header">
            <button type="button" class="close" @click="closeform"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="ajaxModalTitle" data-title="PRO-KAZI">{{title}} item</h4>
        </div>
        <div class="content-area">
            <div :class="{'form-group': true, 'has-error has-feedback': errors.has('name'),
          'has-success has-feedback': (!validatefields.name.invalid && validatefields.name.touched)
          }"
            >
                <label class="control-label col-md-3">Name</label>
                <div class="input-group col-md-9">
                    <input v-model="items_form.name" type="text"
                           class="form-control"
                           name="name"
                           v-validate="'required'"
                           placeholder="Name">
                    <span v-show="errors.has('name')" class="contol-label">{{ errors.first('name') }}</span>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-3">Checked On </label>
                <div class="input-group col-md-9">
                    <div class="col-md-6">
                        <input type="checkbox" v-model="items_form.performed_customer"/> Customers
                    </div>
                    <div class="col-md-6">
                        <input type="checkbox" v-model="items_form.performed_supplier"/> Suppliers
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button :disabled="submitted" type="submit" @click="submitform" class="btn btn-primary"><span class="fa fa-check-circle"></span>
                {{(submitted)?'Please wait...':title}}
            </button>
        </div>

    </div>
</template>
<script>
    export default {
        data: () => ({
            items_form: {
                name: '',
                performed_customer:1,
                performed_supplier:1,
                id: '' //set for update purposes
            },
            submitted:false
        }),
        methods: {
            closeform() {
                this.$modal.hide('check-items');
            },
            submitform() {
                this.$validator.validateAll()
                    .then((res) => {
                        if (res) {
                            this.saveData();
                        }
                    })

            },
            saveData() {
                this.submitted = true;
                this.$http.post('checkitems/save', this.items_form)
                    .then((res) => {
                        this.submitted = false;
                        this.closeform();
                    }, (res)=>{
                        this.submitted = false;
                        this.closeform();
                    });
            },
        },
        computed: {
            title() {
                return (Object.keys(this.edit_data).length !== 0 && this.edit_data.constructor === Object) ? "Update" : "Add"
            },
        },
        mounted() {
            console.log("edit data is ", this.edit_data);
            if (Object.keys(this.edit_data).length > 0) {
                this.items_form.name = this.edit_data.name
                this.items_form.id = this.edit_data.id
            }
        },
        props: {
            edit_data: {
                type: Object,
                required: false
            }
        }
    }
</script>
<style>
    .modal-footer {
        position: absolute;
        bottom: 0;
        right: 0;
    }

    .content-area {
        width: 90%;
        margin: auto;
    }
</style>