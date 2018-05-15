<template>
    <ul data-toggle="ajax-tab" class="nav nav-tabs" role="tablist">
        <li class=""><a @click="changecmp(0)" role="presentation" :class="(active == 0)?'active':''"> All </a></li>
        <li class=""><a @click="changecmp(1)" role="presentation" :class="(active == 1)?'active':''"> Non Submitted </a></li>
        <li class=""><a @click="changecmp(2)" role="presentation" :class="(active == 2)?'active':''"> Partially Submitted </a></li>
        <li class=""><a @click="changecmp(3)" role="presentation" :class="(active == 3)?'active':''"> Fully Sumitted </a></li>
    </ul>
</template>
<script>
    export default {
        data: () => ({
            active: 0
        }),
        methods: {
            changecmp(value) {
                this.$emit('changedtabs', value); //redraw the component only when the value is different
                this.active = value;
            }
        },
        mounted(){
            this.active = 0;
        }

    }
</script>
<style scoped>
    li a {
        cursor: pointer;
    }
</style>