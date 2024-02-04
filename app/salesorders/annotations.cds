using ManageOrders as service from '../../srv/orders.service';
annotate service.Header with {
    OrderStatus @title: 'Status';
    FirstName   @title: 'Name';
    LastName    @title: 'Surname';
    CreatedOn   @title: 'Created on';
    Email       @title: 'Email';
}

annotate service.Header with @(
    // SemanticKey
    Common.SemanticKey     : [ID],

    // Filters
    UI.SelectionFields     : [
        Email,
        FirstName,
        LastName
    ],

    // Header
    UI.HeaderInfo          : {
        $Type         : '',
        ImageUrl      : ImageUrl,
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: FirstName
        },
    },

    UI.PresentationVariant : {
        SortOrder     : [
                        {Property: Email}, ],
        Visualizations: ['@UI.LineItem'],
    },

    // Table
    UI.LineItem            : [
        {
            $Type: 'UI.DataField',
            Value: Email,
            Label: 'Email'
        },
        {
            $Type: 'UI.DataField',
            Value: OrderStatus,
            Label: 'Status'
        },
        {
            $Type: 'UI.DataField',
            Value: FirstName,
            Label: 'Name'
        },
        {
            $Type: 'UI.DataField',
            Value: LastName,
            Label: 'Surname'
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            Label: 'Created On'
        },
        {
            $Type: 'UI.DataField',
            Value: Country
        },
        {
            $Type: 'UI.DataField',
            Value: DeliveryDate,
            Label: 'Delivery'
        },
    ],

    // Facets
    UI.FieldGroup #GroupA  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: FirstName,
                Label: 'Name'
            },
            {
                $Type: 'UI.DataField',
                Value: LastName,
                Label: 'Surname'
            },
            {
                $Type: 'UI.DataField',
                Value: Email,
                Label: 'Email'
            },
            {
                $Type: 'UI.DataField',
                Value: ImageUrl,
                Label: 'Image'
            },
            {
                $Type: 'UI.DataField',
                Value: CreatedOn,
                Label: 'Created on'
            },
            {
                $Type: 'UI.DataField',
                Value: OrderStatus,
                Label: 'Status'
            },
            {
                $Type: 'UI.DataField',
                Value: DeliveryDate,
                Label: 'Estimated delivery date'
            },
            {
                $Type: 'UI.DataField',
                Value: Country,
                Label: 'Country'
            }
        ]
    },
    UI.Facets              : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Header Detail',
            Target: ![@UI.FieldGroup#GroupA]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Oder Items',
            Target: 'Items/@UI.LineItem'
        }
    ]
);

annotate service.Items with @(
    // Table sort order
    UI.PresentationVariant: {
        SortOrder     : [ //Default sort order
        {
            Property  : Price,
            Descending: true,
        }, ],
        Visualizations: ['@UI.LineItem'],
    },

    UI.HeaderInfo         : {
        $Type         : '',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: Name,
            Label: 'Name'
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description,
            Label: 'Description'
        }
    },

    // Table
    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: Name,
            Label: 'Name'
        },
        {
            $Type: 'UI.DataField',
            Value: Description,
            Label: 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: Price,
            Label: 'Price'
        },
        {
            $Type: 'UI.DataField',
            Value: Quantity,
            Label: 'Quantity'
        }
    ],

    // Facets
    UI.FieldGroup #GroupA : {
        $Type: 'UI.FieldGroupType',
        Data : [
                       {
                $Type: 'UI.DataField',
                Value: Name,
                Label: 'Name'
            },
                       {
                $Type: 'UI.DataField',
                Value: Description,
                Label: 'Description'
            },
            {
                $Type: 'UI.DataField',
                Value: ReleaseDate,
                Label: 'Release date'
            },
            {
                $Type: 'UI.DataField',
                Value: DiscontinuedDate,
                Label: 'Discontinued date'
            },
            {
                $Type: 'UI.DataField',
                Value: Price,
                Label: 'Price'
            },
            {
                $Type: 'UI.DataField',
                Value: Height,
                Label: 'Height'
            },
            {
                $Type: 'UI.DataField',
                Value: Width,
                Label: 'Width'
            },
            {
                $Type: 'UI.DataField',
                Value: Depth,
                Label: 'Depth'
            },
            {
                $Type: 'UI.DataField',
                Value: Quantity,
                Label: 'Quantity'
            }
        ]
    },
    UI.Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Detail',
            Target: ![@UI.FieldGroup#GroupA]
        }
    ]
);