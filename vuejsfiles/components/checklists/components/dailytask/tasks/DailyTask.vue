<template>
    <div class="panel clearfix">

        <div class="panel clearfix">
            <div class="page-title clearfix">
                <h1>Daily Tasks</h1>
                <div class="title-button-group">
                    <a class="btn btn-default" @click="additems" title="Add project"><i class="fa fa-plus-circle"></i>
                        Perform todays task</a>
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
                       <!--         <a @click="opentask(props.rowData)" >Open</a>
                       -->     </div>
                        </template>

                    </vue-table>
                    <vuetable-pagination ref="pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>

                </div>
                <modal name="ict-task-form"  @before-close="reloadTable" width="1000px" height="700px">
                  <checklist-form :edit_data="updaterow"></checklist-form>
                </modal>
            </div>
        </div>
    </div>

</template>
<script>
    import vSelect from "vue-select"
    import columns from './fields';
    import VuetablePagination from './../../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../../common/table/Vuetable.vue';
    import appdetails from '../../../../../helpers/appdetails'
    import ChecklistForm from './CheckForm.vue'

    export default {
        data: () => ({
            data: 0,
            columns: columns,
            url: appdetails.approoturl + '/checklist_daily_tasks/list_daily_checks',
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
                return (this.showloading) ? 'Please wait getting daily tasks...' : 'No tasks exist add some'
            }
        },
        components: {
            VuetablePagination, VueTable, vSelect,ChecklistForm
        },
        methods: {
            opentask(data){
              localStorage.setItem('task', data.id);
              this.$emit('changedparentcust', 1);
            },
            reloadTable(){
              this.$refs.vuetable.reload();
            },
            additems(){
                this.$modal.show('ict-task-form');

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


    }
</script>
<style>
    .table-button-container a {
        cursor: pointer;

    }
</style>