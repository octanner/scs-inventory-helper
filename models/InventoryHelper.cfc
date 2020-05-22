component singleton {

    property name="settings" inject="coldbox:setting:inventory-helper";
    property name="apiAuthHelper" inject="ApiAuthHelper";

    public struct function adjust(
        required string Document_Date,
        required string Posting_Date,
        required string Ref_Doc,
        required string Goods_Receipt,
        required string Transaction_Code,
        required string User_Name,
        required string Material_Num,
        required string Plant,
        required string Storage_Loc,
        required string Movement_Type,
        required string Quantity,
        required string Unit_Of_Entry,
        required string Receiving_Material,
        required string Receiving_Plant,
        required string Receiving_Storage_Loc,
        required string Reason,
        required string Cost_Center,
        required string Goods_Movement_Code
    ) {
        var authToken = apiAuthHelper.getApiToken();
        var codeRequest = {
            'Row': {
                'Document_Date': arguments.Document_Date,
                'Posting_Date': arguments.Posting_Date,
                'Ref_Doc': arguments.Ref_Doc,
                'Goods_Receipt': arguments.Goods_Receipt,
                'Transaction_Code': arguments.Transaction_Code,
                'User_Name': arguments.User_Name,
                'Material_Num': arguments.Material_Num,
                'Plant': arguments.Plant,
                'Storage_Loc': arguments.Storage_Loc,
                'Movement_Type': arguments.Movement_Type,
                'Quantity': arguments.Quantity,
                'Unit_Of_Entry': arguments.Unit_Of_Entry,
                'Receiving_Material': arguments.Receiving_Material,
                'Receiving_Plant': arguments.Receiving_Plant,
                'Receiving_Storage_Loc': arguments.Receiving_Storage_Loc,
                'Reason': arguments.Reason,
                'Cost_Center': arguments.Cost_Center,
                'Goods_Movement_Code': (arguments.Goods_Movement_Code EQ '') ? getGoodsMovementCode(
                    Movement_Type = arguments.Transaction_Code
                ) : arguments.Goods_Movement_Code
            }
        };
        try {
            cfhttp(
                method="POST",
                charset="utf-8",
                url=fullUrl,
                result="result"
            ) {
                cfhttpparam(type="header", name="Authorization", value="Bearer " & authToken);
                cfhttpparam(type="header", name="Content-Type", value="application/x-www-form-urlencoded");
                cfhttpparam(type="body", name="raw", value=serializeJSON(codeRequest));
            };

            if (
                result.ResponseHeader['Status_Code'] == '200' ||
                result.ResponseHeader['Status_Code'] == '201'
            ) {
                response.success = true;
                response.content = result.FileContent;
            } else {
                response.success = false;
                response.content = result.Statuscode;
            }
        } catch (any e) {
            response.success = false;
            response.content = 'Error: ' & e.message;
        }

        return response;
    }
}