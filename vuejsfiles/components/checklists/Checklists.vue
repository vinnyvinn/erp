<template>
    <div class="row">
        <div class="col-md-2">
            <side-bar @changed="changedcmp"></side-bar>
        </div>
        <div class="col-md-10">
            <component :is="loadedcmp" @customerchanged="changedcustomer"></component>
        </div>
    </div>
</template>
<script>
    import SideBar from './layout/SideBar.vue'
    import ChecklistsItems from './components/checklistitems/ChecklistItems.vue'
    import DailyTasks from './components/dailytask/Tasks.vue'

    export default{
        data:()=>({
            loadedcmp:ChecklistsItems,
            showloading:false
        }),
        components:{
            SideBar, ChecklistsItems,DailyTasks
        },
        methods:{
            changedcustomer(val){
                this.showloading=val;
            },
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = ChecklistsItems;
                        break;
                    };
                    case 1:{
                        this.loadedcmp = DailyTasks;
                        break;
                    };

                    default:{
                        this.loadedcmp = ChecklistsItems;
                        break;
                    }
                }
            }
        }
    }
</script>