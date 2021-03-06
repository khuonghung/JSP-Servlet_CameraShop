create table attribute
(
    id     int auto_increment
        primary key,
    name   varchar(50)      not null,
    value  varchar(50)      not null,
    remove bit default b'0' null
);

create table brand
(
    id          int auto_increment
        primary key,
    name        varchar(100)     not null,
    address     varchar(200)     not null,
    phonenumber varchar(15)      not null,
    email       varchar(100)     not null,
    describes   varchar(200)     null,
    remove      bit default b'0' null
);

create table category
(
    id        int auto_increment
        primary key,
    name      varchar(100)     not null,
    describes varchar(200)     null,
    remove    bit default b'0' null
);

create table contact
(
    id        int auto_increment
        primary key,
    email     varchar(50)                           not null,
    subject   varchar(100)                          not null,
    body      text                                  not null,
    date_send timestamp default current_timestamp() null,
    seen      bit       default b'0'                null
);

create table staff
(
    id            int auto_increment
        primary key,
    lastname      varchar(20)                           not null,
    firstname     varchar(11)                           not null,
    birthday      date                                  not null,
    sex           bit       default b'1'                null,
    address       varchar(200)                          not null,
    phonenumber   varchar(15)                           not null,
    email         varchar(50)                           not null,
    password      varchar(50)                           not null,
    role          int       default 0                   null,
    note          varchar(500)                          null,
    active        bit       default b'0'                null,
    block         bit       default b'0'                null,
    remove        bit       default b'0'                null,
    timecreate    timestamp default current_timestamp() not null,
    idstaffcreate int                                   null,
    avatar        varchar(200)                          not null,
    constraint staff_ibfk_1
        foreign key (idstaffcreate) references staff (id)
);

create table banner
(
    id            int auto_increment
        primary key,
    name          varchar(100)                          null,
    describes     varchar(200)                          null,
    event         varchar(100)                          null,
    image         varchar(200)                          not null,
    idstaffcreate int                                   null,
    datecreate    timestamp default current_timestamp() not null,
    dateend       date                                  null,
    link          varchar(200)                          null,
    remove        bit       default b'0'                null,
    constraint banner_ibfk_1
        foreign key (idstaffcreate) references staff (id)
);

create index idstaffcreate
    on banner (idstaffcreate);

create table billimport
(
    id            int auto_increment
        primary key,
    idstaffimport int                                   not null,
    idstaffcheck  int                                   not null,
    dateimport    timestamp default current_timestamp() not null,
    remove        bit       default b'0'                null,
    constraint billimport_ibfk_1
        foreign key (idstaffimport) references staff (id),
    constraint billimport_ibfk_2
        foreign key (idstaffcheck) references staff (id)
);

create index idstaffcheck
    on billimport (idstaffcheck);

create index idstaffimport
    on billimport (idstaffimport);

create table product
(
    id         int auto_increment
        primary key,
    name       varchar(100)       not null,
    idcategory int                null,
    idbrand    int                null,
    idstaffadd int                not null,
    describes  text               null,
    views      int   default 0    null,
    status     bit   default b'1' null,
    remove     bit   default b'0' null,
    persensale float default 0    null,
    constraint product_ibfk_1
        foreign key (idcategory) references category (id),
    constraint product_ibfk_2
        foreign key (idbrand) references brand (id),
    constraint product_ibfk_3
        foreign key (idstaffadd) references staff (id)
);

create index idbrand
    on product (idbrand);

create index idcategory
    on product (idcategory);

create index idstaffadd
    on product (idstaffadd);

create table productdetails
(
    id          int auto_increment
        primary key,
    idproduct   int              null,
    idattribute int              null,
    price       bigint default 1 null,
    location    varchar(200)     not null,
    quantity    int    default 0 null,
    constraint productdetails_ibfk_1
        foreign key (idproduct) references product (id),
    constraint productdetails_ibfk_2
        foreign key (idattribute) references attribute (id),
    constraint price
        check (`price` > 0),
    constraint quantity
        check (`quantity` > -1)
);

create table billimportdetails
(
    id              int auto_increment
        primary key,
    idbillimport    int              null,
    idproductdetail int              null,
    quantity        int    default 1 null,
    price           bigint default 0 null,
    constraint billimportdetails_ibfk_1
        foreign key (idbillimport) references billimport (id),
    constraint billimportdetails_ibfk_2
        foreign key (idproductdetail) references productdetails (id),
    constraint price
        check (`price` > -1),
    constraint quantity
        check (`quantity` > 0)
);

create index idbillimport
    on billimportdetails (idbillimport);

create index idproductdetail
    on billimportdetails (idproductdetail);

create index idattribute
    on productdetails (idattribute);

create index idproduct
    on productdetails (idproduct);

create table productimage
(
    id        int auto_increment
        primary key,
    idproduct int          not null,
    image     varchar(200) not null,
    constraint productimage_ibfk_1
        foreign key (idproduct) references product (id)
);

create index idproduct
    on productimage (idproduct);

create table repcontact
(
    id        int auto_increment
        primary key,
    idcontact int                                   null,
    idstaff   int                                   null,
    date_rep  timestamp default current_timestamp() not null,
    subject   varchar(100)                          not null,
    body      text                                  not null,
    email     varchar(45)                           not null,
    constraint repcontact___fk_staff
        foreign key (idstaff) references staff (id),
    constraint repcontact_contact_id_fk
        foreign key (idcontact) references contact (id)
);

create index idstaffcreate
    on staff (idstaffcreate);

create table visit
(
    phonenumber varchar(15)  not null
        primary key,
    name        varchar(30)  null,
    address     varchar(200) null,
    email       varchar(100) not null,
    note        varchar(500) null,
    password    varchar(50)  null
);

create table likes
(
    id          int auto_increment
        primary key,
    phonenumber varchar(15) not null,
    idproduct   int         not null,
    constraint likes___fk
        foreign key (phonenumber) references visit (phonenumber),
    constraint likes___fk_2
        foreign key (idproduct) references product (id)
);

create table voucher
(
    id            varchar(30)                           not null
        primary key,
    event         varchar(100)                          not null,
    idstaffcreate int                                   not null,
    datecreate    timestamp default current_timestamp() not null,
    pricesale     bigint    default 1                   null,
    quantity      int       default 1                   null,
    requantity    int       default 0                   null,
    datestart     date                                  null,
    dateend       date                                  null,
    describes     varchar(500)                          null,
    remove        bit       default b'0'                null,
    constraint voucher_ibfk_1
        foreign key (idstaffcreate) references staff (id),
    constraint quantity
        check (`quantity` > 0),
    constraint requantity
        check (`requantity` > -1)
);

create table payment
(
    id               int auto_increment
        primary key,
    idstaffsale      int                 null,
    idstaffcashier   int                 null,
    phonenumbervisit varchar(15)         null,
    idvoucher        varchar(30)         null,
    payments         varchar(50)         null,
    paymentamout     bigint default 0    null,
    statuspayment    bit    default b'0' null,
    statusbill       bit    default b'1' null,
    constraint payment_ibfk_1
        foreign key (idstaffsale) references staff (id),
    constraint payment_ibfk_2
        foreign key (idstaffcashier) references staff (id),
    constraint payment_ibfk_3
        foreign key (phonenumbervisit) references visit (phonenumber),
    constraint payment_ibfk_4
        foreign key (idvoucher) references voucher (id),
    constraint paymentamout
        check (`paymentamout` > -1)
);

create index idstaffcashier
    on payment (idstaffcashier);

create index idstaffsale
    on payment (idstaffsale);

create index idvoucher
    on payment (idvoucher);

create index phonenumbervisit
    on payment (phonenumbervisit);

create table paymentdetails
(
    id               int auto_increment
        primary key,
    idpayment        int              null,
    idproductdetails int              null,
    quantity         int    default 1 null,
    price            bigint default 0 null,
    pricesale        bigint default 0 null,
    constraint paymentdetails_ibfk_1
        foreign key (idpayment) references payment (id),
    constraint paymentdetails_ibfk_2
        foreign key (idproductdetails) references productdetails (id),
    constraint price
        check (`price` > -1),
    constraint quantity
        check (`quantity` > 0)
);

create index idpayment
    on paymentdetails (idpayment);

create index idproductdetails
    on paymentdetails (idproductdetails);

create index idstaffcreate
    on voucher (idstaffcreate);


