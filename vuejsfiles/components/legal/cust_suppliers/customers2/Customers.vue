<template>
    <div>
      <tabs @changedtabs="changedcmp"></tabs>
        <component :is="loadedcmp"></component>
    </div>

</template>
<script>
    import Tabs from './layout/Tabs.vue'
    import AllCustomers from './components/allcustomers/AllCustomers.vue'
    import PartiallySumitted from './components/partiallysubmitted/PartiallySubmitted.vue';
    import NonSubmitted from './components/nonsubmitted/NonSubmitted.vue';
    import FullySubmitted from './components/fullysubmitted/FullySubmitted.vue';
    export default {
        data:()=>({
            loadedcmp:AllCustomers
        }),
        components:{
            Tabs,AllCustomers,PartiallySumitted,NonSubmitted,FullySubmitted
        },
        methods:{
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = AllCustomers;
                        break;
                    };
                    case 1:{
                        this.loadedcmp = NonSubmitted;
                        break;
                    };
                    case 2:{
                        this.loadedcmp = PartiallySumitted;
                        break;
                    };
                    case 3:{
                        this.loadedcmp = FullySubmitted;
                        break;
                    };
                    default:{
                        this.loadedcmp = AllCustomers;
                        break;
                    }
                }
            }
        }

    }
</script>