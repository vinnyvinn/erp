let columns = [
    {
        'title': '#',
        name: 'idval'
    },
    {
        name: 'Name',
        sortField: 'Name',
        title: 'Name',
    },
    {
        name: 'Telephone',
        sortField: 'Telephone',
        title: 'Telephone',
    },

    {
        name: 'EMail',
        sortField: 'EMail',
        title: 'Email',
    },
    {
        name: 'status_val',
        sortField: 'status',
        title: 'Status',
        callback: 'statusLabel'
    },
    {
        name: '__slot:actions',
        dataClass: 'center aligned',
        title: 'Actions'
    }

];

export default columns