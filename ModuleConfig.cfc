component {

    // Module Properties
    this.title = 'Inventory Helper';
    this.name = 'inventory-helper';
    this.author = 'Mike Burt';
    this.webUrl = 'https://github.com/octanner/scs-inventory-helper';
    this.description = 'A module to help manage inventory adjustments via an API';
    this.version = '0.0.0';
    // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
    this.viewParentLookup = true;
    // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
    this.layoutParentLookup = true;

    function configure() {
        binder.map('ApiAuthHelper').to('#moduleMapping#.modules.api-auth-helper.models.ApiAuthHelper');

        settings = {baseUrl: 'https://any-api.com/'};
    }

}
