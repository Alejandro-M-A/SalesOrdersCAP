sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ama.logali.salesorders.salesorders',
            componentId: 'HeaderObjectPage',
            contextPath: '/Header'
        },
        CustomPageDefinitions
    );
});