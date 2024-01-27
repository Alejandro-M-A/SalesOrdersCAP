namespace com.ama.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Header : cuid, managed {
    Email        : String(30) @mandatory;
    FirstName    : String(30);
    LastName     : String;
    Country      : String(30);
    CreatedOn    : Date;
    DeliveryDate : DateTime;
    OrderStatus  : Integer enum {
        New       = 1;
        InProcess = 2;
        Completed = 3;
    };
    ImageUrl     : String;
    Items        : Composition of many Items
                       on Items.Header = $self;

}

entity Items : cuid, managed {
    Name             : String(40);
    Description      : String(40);
    ReleaseDate      : Date;
    DiscontinuedDate : Date;
    Price            : Decimal(12, 2);
    Height           : Decimal(15, 3);
    Width            : Decimal(13, 3);
    Depth            : Decimal(12, 2);
    Quantity         : Decimal(16, 2);
    Header           : Association to Header;
    UnitOfMesaures   : Association to UnitOfMesaures;

}

entity UnitOfMesaures {
    key ID          : String(2);
        Description : localized String;
}
