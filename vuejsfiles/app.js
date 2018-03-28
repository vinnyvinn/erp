<<<<<<< HEAD
import Vue from 'vue'
import CustomerSuppliers from './components/legal/cust_suppliers/CustomerSuppliers.vue';
import Checklists from './components/checklists/Checklists.vue';
import appdetails from './helpers/appdetails';
import VueResource from 'vue-resource';
import VModal from 'vue-js-modal'
import VeeValidate from 'vee-validate';

import VuejsDialog from "vuejs-dialog"

Vue.use(VuejsDialog)
Vue.use(VModal);
Vue.use(VueResource);
Vue.http.options.root = appdetails.approoturl;
const config = {
    errorBagName: 'errors', //change if property conflicts.
    fieldsBagName: 'validatefields',
    events: 'input|blur',
};

//VeeValidate setup
Vue.use(VeeValidate, config);

const app = new Vue({
    el: '#vuejs_prokazi_app_id_dont_change_or_reuse_this',
    components:{
        CustomerSuppliers,Checklists
    }
=======
import Vue from 'vue'
import CustomerSuppliers from './components/legal/cust_suppliers/CustomerSuppliers.vue';
import Checklists from './components/checklists/Checklists.vue';
import appdetails from './helpers/appdetails';
import VueResource from 'vue-resource';
import VModal from 'vue-js-modal'
import VeeValidate from 'vee-validate';
import Reports from './components/reports/Reports.vue'

import VuejsDialog from "vuejs-dialog"

Vue.use(VuejsDialog)
Vue.use(VModal);
Vue.use(VueResource);
Vue.http.options.root = appdetails.approoturl;
const config = {
    errorBagName: 'errors', //change if property conflicts.
    fieldsBagName: 'validatefields',
    events: 'input|blur',
};

//VeeValidate setup
Vue.use(VeeValidate, config);

const app = new Vue({
    el: '#vuejs_prokazi_app_id_dont_change_or_reuse_this',
    components:{
        CustomerSuppliers,Checklists,
        Reports
    }
>>>>>>> 1e72c1cdecd492cedec5ee002d28509a12358e2b
});