<template>
    <div>
        <component :is="loadedcmp" @changedreports="geomchanged"></component>
    </div>
</template>
<script>
    import IctReports from './ict/IctReports.vue';
    import ReportsDashboard from './ReportsDashboard.vue';

    export default {
        data: () => ({
            loadedcmp: ReportsDashboard,
            showloading: false
        }),
        methods: {
            geomchanged(val) {
                switch (val) {
                    case 'ict': {
                        this.loadedcmp = IctReports;
                        break;
                    }
                    case 'dash': {
                        this.loadedcmp = ReportsDashboard;
                        break;
                    }
                }
            }

        },
        components: {
            IctReports, ReportsDashboard
        }

    }
</script>