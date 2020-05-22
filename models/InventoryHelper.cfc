component singleton {

	property name = "settings" inject = "coldbox:setting:inventory-helper";
	property name = "apiAuthHelper" inject = "ApiAuthHelper";


	// Example Funtion from Images Helper
	// function save(
	// 	required collection,
	// 	required resourceId,
	// 	required imageUrl
	// ) {
	// 	var authToken = apiAuthHelper.getApiToken();
	// 	var repoUrl = getRepoUrl( collection = arguments.collection, resourceId = arguments.resourceId );
	// 	var fullUrl = settings.baseUrl & repoUrl;

	// 	try {
	// 		cfhttp(
	// 			method = "POST",
	// 			charset = "utf-8",
	// 			url = fullUrl,
	// 			result = "result"
	// 		) {
	// 			cfhttpparam( type = "header", name = "Authorization", value = "Bearer " & authToken );
	// 			cfhttpparam( type = "file", name = "image", file = arguments.imageUrl );
	// 		};

	// 		if (
	// 			result.ResponseHeader[ "Status_Code" ] == "200" ||
	// 			result.ResponseHeader[ "Status_Code" ] == "201"
	// 		) {
	// 			response.success = true;
	// 			response.content = result.FileContent;
	// 		} else {
	// 			response.success = false;
	// 			response.content = result.Statuscode;
	// 		}
	// 	} catch ( any e ) {
	// 		response.success = false;
	// 		response.content = "Error: " & e.message;
	// 	}

	// 	return response;
	// }


}