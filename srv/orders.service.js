const cds = require("@sap/cds");
const { Header } = cds.entities("com.ama.logali");
const { Items } = cds.entities("com.ama.logali");

module.exports = function (srv) {
    /* Create Header*/
    srv.on("CREATE", "Header", async (req) => {
        console.log(req.data);
        let returnData = await cds
            .transaction(req)
            .run(
                console.log(req.data),
                INSERT.into(Header).entries({
                    ID: req.data.ID,
                    Email: req.data.Email,
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                    Country: req.data.Country,
                    CreatedOn: req.data.CreatedOn,
                    DeliveryDate: req.data.DeliveryDate,
                    OrderStatus: req.data.OrderStatus,
                    ImageUrl: req.data.ImageUrl
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Record Not Inserted");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });

        console.log("Before End", returnData);
        return returnData;
    });



    //***********UPDATE*******
    srv.on("UPDATE", "Header", async (req) => {
        let returnData = await cds.transaction(req).run(
            [
                UPDATE(Header, req.data.ID).set({
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName
                }),
            ]
        ).then((resolve, reject) => {
            console.log("Resolve: ", resolve[0]);
            console.log("Reject: ", reject);

            if (resolve[0] == 0) {
                req.error(409, "Record not found");
            }
        }).catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
        console.log("Befor End: ", returnData);
        return returnData;
    });

}