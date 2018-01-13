<template>
    <div>
        <div class="modal-header">
            <button type="button" class="close" @click="closeform"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title"> Checklist </h4>
        </div>
        <div class="content-area">
            <div :class="{'form-group': true}" >
                <label class="control-label col-md-3">Name</label>
                <div class="input-group col-md-9">
                    <input v-model="items_form.name" type="text"
                           class="form-control"
                           name="name"
                           v-validate="'required'"
                           placeholder="Name">
               </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-3">Checklist Type </label>
                <div class="input-group col-md-9">
                    <v-select v-model="items_form.type" :options="checkstypes"></v-select>
                </div>
            </div>
            <div :class="{'form-group': true}" >
                <label class="control-label col-md-3">Comment</label>
                <div class="input-group col-md-9">
                    <textarea class="form-control" v-model="items_form.comment">

                    </textarea>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button :disabled="submitted" type="submit" @click="submitform" class="btn btn-primary"><span class="fa fa-check-circle"></span>
                {{(submitted)?'Please wait...':'Save'}}
            </button>
        </div>

    </div>
</template>
<script>
    import vSelect from "vue-select"
    export default {
        data: () => ({
            items_form: {
                name: '',
                type:'',
                comment:'',
                id:''

            },
            submitted:false,
            selected:null,
            checkstypes:[],
        }),
        methods: {
            closeform() {
                this.$modal.hide('checklist-form');
            },
            submitform() {
                this.submitted = true;
                this.$http.post('checklists/save', this.items_form)
                    .then((res) => {
                        this.submitted = false;
                        this.closeform();
                    }, (res)=>{
                        this.submitted = false;
                        this.closeform();
                    });
            },
            getChecklistTypes(){
                this.$http.get('checklists/checklist_types')
                    .then((res)=>{
                        this.checkstypes = [];
                       res.body.forEach((type)=>{
                           this.checkstypes.push({label:type.name, value:type.id});
                       })
                    })
            }
        },
        components: {
            vSelect
        },
        mounted() {
            if (Object.keys(this.edit_data).length > 0) {
                this.items_form.name = this.edit_data.name
                this.items_form.id = this.edit_data.id
                this.items_form.comment = this.edit_data.comment
                this.items_form.type = this.edit_data.performed_on
            }

            this.getChecklistTypes();
        },
        props: {
            edit_data: {
                type: Object,
                required: true
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