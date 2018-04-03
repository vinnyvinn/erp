<template>
    <div>
        <component :is="loadedcmp" @changedparentcust="changedcmp"></component>
    </div>

</template>
<script>
    import DailyTasks from './tasks/DailyTask.vue'
    import ViewTask from './tasks/View.vue'
    export default {
        data:()=>({
            loadedcmp:DailyTasks
        }),
        components:{
            DailyTasks,ViewTask
        },
        methods:{
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = DailyTasks;
                        break;
                    };
                    case 1:{
                        this.loadedcmp = ViewTask;
                        break;
                    };
                    default:{
                        this.loadedcmp = DailyTasks;
                        break;
                    }
                }
            }
        }

    }
</script>