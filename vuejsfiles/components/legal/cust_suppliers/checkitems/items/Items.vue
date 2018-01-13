<template>
    <div class="panel clearfix">

        <div class="panel clearfix">
            <div class="page-title clearfix">
                <h1>List of items to be checked on Customers and
                    Suppliers</h1>
                <div class="title-button-group">
                    <a class="btn btn-default" @click="additems" title="Add project"><i class="fa fa-plus-circle"></i>
                        Add Items</a>
                </div>
            </div>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="monthly-invoices">
                    <vue-table :fields="columns" track-by="DCLink" class="table [css.tableClass]"
                               :api-url="url"
                               ref="vuetable"
                               :noDataTemplate="nodatatemplate"
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
                                <a @click="editRow(props.rowData)" ><i class="fa fa-pencil"></i></a>
                                <a @click="deleteRow(props.rowData)" ><i class="fa fa-close"></i></a>
                            </div>
                        </template>
                    </vue-table>
                    <vuetable-pagination ref="pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>

                </div>
                <div role="tabpanel" class="tab-pane fade" id="yearly-invoices"></div>
            </div>
        </div>
        <modal name="check-items" @before-close="reloadTable" width="350px" height="200px">
            <items-form :edit_data="selected"></items-form>
        </modal>
    </div>

</template>
<script>
    import columns from './fields';
    import VuetablePagination from './../../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../../common/table/Vuetable.vue';
    import appdetails from '../../../../../helpers/appdetails'
    import ItemsForm from './Form.vue';

    export default {
        data: () => ({
            data: 0,
            columns: columns,
            url: appdetails.approoturl + '/Checkitems/index',
            sortOrder: [{
                field: 'name',
                direction: 'asc'
            }],
            selected: {},
            showloading:false
        }),
        computed:{
          nodatatemplate(){
              return (this.showloading)?"Fetching items please wait....":'No items exists, add some'
          }
        },

        components: {
            VuetablePagination, VueTable, ItemsForm
        },
        methods: {
            additems() {
                this.$modal.show('check-items');
            },
            editRow(data){
                this.selected = data;
                this.$modal.show('check-items');
            },
            deleteRow(data){
                this.$dialog.confirm('Are you sure you would like to delete '+data.name,{loader:true})
                    .then( (dialog)=>{
                        this.$http.post('checkitems/delete', data)
                            .then((res) => {
                              dialog.close();
                              this.reloadTable();
                            }, (err) => {
                                dialog.close();
                            });
                    })
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
            reloadTable() {
                this.$refs.vuetable.reload();
                this.selected = {};
            }
        },

    }
</script>
<style>
    .table-button-container a{
        cursor: pointer;
        padding: 5px;
    }
</style>