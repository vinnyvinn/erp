<template>
    <div class="col-md-12" v-if="dataloaded">
        <div class="page-title mb15 clearfix">
            <h1>
                <i class="fa fa-th-large" title="Open"></i>
                {{customer_name}} Checks</h1>
            <div class="title-button-group" id="project-timer-box">
                <a @click="backtocustomers" class="btn btn-sm btn-info"><i
                        class="fa fa fa-chevron-left"></i> Back to customers</a></div>
        </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade active in">
                <div class="panel">
                    <div class="tab-title clearfix">
                        <h4>Last Checks</h4>
                        <div class="title-button-group">
                            <a @click="performchecks" class="btn btn-default"><i class="fa fa-plus-circle"></i> Perform Checks</a>
                        </div>
                    </div>
                    <vue-table :fields="columns" track-by="id" class="table [css.tableClass]"
                               :api-url="url"
                               ref="vuetable"
                               :noDataTemplate="noDataTemplate"
                               table-class="table table-bordered table-striped table-hover"
                               data-path="data"
                               pagination-path="links"
                               @vuetable:pagination-data="onPaginationData"
                               @vuetable:loading="onStartLoading"
                               @vuetable:loaded="onLoaded"

                    >
                        <template slot="actions" slot-scope="props">
                            <div class="table-button-container">
                                <a @click="removeitem(props.rowData)"><i class="fa fa fa-close"></i> </a>
                            </div>
                        </template>

                    </vue-table>
                    <vuetable-pagination ref="pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>

                </div>
            </div>

        </div>
        <modal name="customer_checks" @before-close="reloadTable" width="850" height="800px">
            <customer-check-form></customer-check-form>
        </modal>
    </div>

</template>
<script>
    import VuetablePagination from './../../../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../../../common/table/Vuetable.vue';
    import appdetails from '../../../../../../helpers/appdetails'
    import columns from './viewfields';
    import CustomerCheckForm from './CheckForm.vue'

    export default {
        data: () => ({
            customer_name: '',
            dataloaded: false,
            showloading: false,
            columns: columns,
            url: appdetails.approoturl + '/customers/getCustomersChecks/' + localStorage.getItem('customer'),
        }),
        components: {
            VuetablePagination, VueTable,CustomerCheckForm
        },
        computed: {
            noDataTemplate() {
                return (this.showloading) ? 'Please wait getting all check records...' : 'No records exist perform checks'
            }
        },
        methods: {
            performchecks(){
                this.$modal.show('customer_checks');

            },
            fetchCustomerdata() {
                this.dataloaded = false;
                this.$http.post('customers/getCustomer', {id: localStorage.getItem('customer')})
                    .then((res) => {
                        this.dataloaded = true;
                        this.customer_name = res.body.Name;
                    }, (err) => {
                        this.dataloaded = true;
                    });
            },
            removeitem(data) {
                this.$http.post('customers/delete_check', {id: localStorage.getItem('customer')})
                    .then((res) => {
                        this.$refs.vuetable.reload();
                    });
            },
            backtocustomers() {
                this.$emit('changedparentcust', 0);
            },
            onPaginationData(paginationData) {

                this.$refs.pagination.setPaginationData(paginationData);

            },
            reloadTable(){
                this.$refs.vuetable.reload();
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
            //fetch project data from localstorage
            if (!localStorage.getItem('customer')) {
                this.$emit('changedparentcust', 0);
                return;
            }
            this.fetchCustomerdata();

        }
    }
</script>
<style>
    a {
        cursor: pointer;
    }
</style>