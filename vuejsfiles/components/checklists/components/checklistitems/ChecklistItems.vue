<template>
    <div class="panel clearfix">

        <div class="panel clearfix">
            <div class="page-title clearfix">
                <h1>List of checklist items</h1>
                <div class="title-button-group">
                    <a class="btn btn-default" @click="additems" title="Add project"><i class="fa fa-plus-circle"></i>
                        Add Checklists</a>
                </div>
            </div>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="monthly-invoices">
                    <vue-table :fields="columns" class="table [css.tableClass]"
                               :api-url="url"
                               ref="vuetable"
                               :noDataTemplate="noDataTemplate"
                               :sort-order="sortOrder"
                               table-class="table table-bordered table-striped table-hover"
                               data-path="data"
                               pagination-path="links"
                               @vuetable:pagination-data="onPaginationData"
                               @vuetable:loading="onStartLoading"
                               @vuetable:loaded="onLoaded"

                    >
                        <template slot="actions" slot-scope="props">
                            <div class="table-button-container">
                                <a @click="updateRow(props.rowData)" ><i class="fa fa-pencil"></i></a>
                                <a @click="deleteRow(props.rowData)" ><i class="fa fa-close"></i></a>
                            </div>
                        </template>

                    </vue-table>
                    <vuetable-pagination ref="pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>

                </div>
                <modal name="checklist-form"  @before-close="reloadTable" width="450px" height="300px">
                  <checklist-form :edit_data="updaterow"></checklist-form>
                </modal>
            </div>
        </div>
    </div>

</template>
<script>
    import vSelect from "vue-select"
    import columns from './fields';
    import VuetablePagination from './../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../common/table/Vuetable.vue';
    import appdetails from '../../../../helpers/appdetails'
    import ChecklistForm from './CheckForm.vue'

    export default {
        data: () => ({
            data: 0,
            columns: columns,
            url: appdetails.approoturl + '/checklists/list_checklists',
            sortOrder: [{
                field: 'name',
                direction: 'asc'
            }],
            showloading: false,
            selected: null,
            updaterow: {},
        }),
        computed: {
            noDataTemplate() {
                return (this.showloading) ? 'Please wait getting all checklists...' : 'No checklists exist add some'
            }
        },
        components: {
            VuetablePagination, VueTable, vSelect,ChecklistForm
        },
        methods: {
            deleteRow(data){
                this.$dialog.confirm('Are you sure you would like to delete '+data.name,{loader:true})
                    .then( (dialog)=>{
                        this.$http.post('checklists/delete', data)
                            .then((res) => {
                                dialog.close();
                                this.reloadTable();
                            }, (err) => {
                                dialog.close();
                            });
                    })
            },
            updateRow(data){
                this.updaterow = data;
                this.$modal.show('checklist-form');
            },
            reloadTable(){
              this.$refs.vuetable.reload();
            },
            additems(){
                this.$modal.show('checklist-form');

            },
            fetchChecklists() {
                this.$emit('customerchanged', false);
                this.$http.get('customers/list_customers')
                    .then((res) => {
                        this.$emit('customerchanged', true);
                    }, (err) => {
                        this.$emit('customerchanged', false);
                    });
            },
            open(data) {
                localStorage.setItem('customer', data.DCLink);
                this.$emit('changedparentcust', 1)
            },
            onPaginationData(paginationData) {

                this.$refs.pagination.setPaginationData(paginationData);

            },
            onChangePage(page) {
                this.$refs.vuetable.changePage(page)
            },
            onStartLoading() {
                this.showloading = true;
            },
            onLoaded() {
                this.showloading = false;
            },
        },

        mounted() {
            this.fetchChecklists();
        }

    }
</script>
<style>
    .table-button-container a {
        cursor: pointer;

    }
</style>