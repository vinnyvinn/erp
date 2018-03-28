<template>
    <div class="row">
        <div class="col-md-4">
            <div class="single category">
                <h3 @click="goback" class="side-title">
                    Back
                </h3>
                <div class="filter-area">
                    <reports-filters></reports-filters>
                </div>
            </div>
        </div>
        <div class="col-md-8"></div>
        <h1>Ict Reports</h1>
    </div>
</template>
<script>
    import ReportsFilters from './ReportsFilters.vue'

    export default {
        components: {
            ReportsFilters
        },
        methods:{
            goback(){
                this.$emit('changedreports','dash')
            }
        }

    }
</script>

