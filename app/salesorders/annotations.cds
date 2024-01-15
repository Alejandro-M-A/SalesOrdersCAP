using ManageOrders as service from '../../srv/orders.service';

annotate service.Header with @(
    UI.SelectionFields: [
        FirstName,
        LastName
    ],
    UI.HeaderInfo     : {
        $Type         : '',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
    },
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Email',
            Value: Email,
        },
        {
            $Type: 'UI.DataField',
            Label: 'FirstName',
            Value: FirstName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'LastName',
            Value: LastName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: Country,
        },
    ]
);

annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email',
                Value: Email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'FirstName',
                Value: FirstName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'LastName',
                Value: LastName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: Country,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CreatedOn',
                Value: CreatedOn,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DeliveryDate',
                Value: DeliveryDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'OrderStatus',
                Value: OrderStatus,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ImageUrl',
                Value: ImageUrl,
            },
        ],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : 'General Information',
            Target: 'Items/@UI.LineItem',
        },
    ]
);

annotate service.Item with @(
    UI.PresentationVariant: {
        SortOrder     : [ //Default sort order
        {
            Property  : Name,
            Descending: true,
        }, ],
        Visualizations: ['@UI.LineItem'],
    },
    UI.HeaderInfo         : {
        $Type         : '',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
    },
    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: Name
        },
        {
            $Type: 'UI.DataField',
            Value: Description
        },
        {
            $Type: 'UI.DataField',
            Value: Price
        },
        {
            $Type: 'UI.DataField',
            Value: Quantity
        }
    ]
);
