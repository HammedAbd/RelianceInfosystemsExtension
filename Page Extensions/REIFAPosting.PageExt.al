pageextension 70976599 REIFAPosting extends "FA Posting Groups"
{
    layout
    {
        // Add changes to page layout here
        addafter(Code)
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }

        modify("Write-Down Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post any write-downs for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Appreciation Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post appreciation transactions for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Custom 1 Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post Custom-1 transactions for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Custom 2 Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post Custom-2 transactions for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Write-Down Acc. on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post write-downs of fixed assets to when you dispose of fixed assets in this posting group.';
            Visible = True;
        }
        modify("Appreciation Acc. on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post appreciation to when you dispose of fixed assets in this posting group.';
            Visible = True;
        }
        modify("Custom 1 Account on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post Custom-1 transactions to when you dispose of fixed assets in this posting group.';
            Visible = True;
        }
        modify("Custom 2 Account on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post Custom-2 transactions to when you dispose of fixed assets in this posting group.';
            Visible = True;
        }




        modify("Book Val. Acc. on Disp. (Gain)")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the G/L account number you want the program to post assets'' book value to when you dispose of fixed assets at a gain on book value.';
            Visible = True;
        }
        modify("Book Val. Acc. on Disp. (Loss)")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the G/L account number to which to post assets'' book value, when you dispose of fixed assets at a loss on book value.';
            Visible = True;
        }
        modify("Sales Acc. on Disp. (Gain)")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the G/L account number you want to post sales to when you dispose of fixed assets at a gain on book value.';
            Visible = True;
        }
        modify("Sales Acc. on Disp. (Loss)")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the G/L account number to which you want to post sales, when you dispose of fixed assets at a loss on book value.';
            Visible = True;
        }
        modify("Write-Down Bal. Acc. on Disp.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post write-downs of fixed assets to when you dispose of fixed assets.';
            Visible = True;
        }
        modify("Apprec. Bal. Acc. on Disp.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post appreciation transactions of fixed assets to when you dispose of fixed assets.';
            Visible = True;
        }
        modify("Custom 1 Bal. Acc. on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post custom-1 transactions of fixed assets to when you dispose of fixed assets.';
            Visible = True;
        }
        modify("Custom 2 Bal. Acc. on Disposal")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post custom-2 transactions of fixed assets to when you dispose of fixed assets.';
            Visible = True;
        }
        modify("Maintenance Expense Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post maintenance expenses for fixed assets to in this posting group.';
        }
        modify("Maintenance Bal. Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post maintenance expenses for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Acquisition Cost Bal. Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post Retail cost for fixed assets to in this posting group.';
        }
        modify("Depreciation Expense Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger account number to post depreciation expense for fixed assets to in this posting group.';
        }
        modify("Write-Down Expense Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post write-downs for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Appreciation Bal. Account")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post appreciation for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Custom 1 Expense Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post custom-1 transactions for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Custom 2 Expense Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account number to post custom-2 transactions for fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Sales Bal. Acc.")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the general ledger balancing account to post sales when you dispose of fixed assets to in this posting group.';
            Visible = True;
        }
        modify("Allocated Acquisition Cost %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage of Retail cost that can be allocated when Retail cost is posted.';
            Visible = True;
        }
        modify("Allocated Depreciation %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage of depreciation that can be allocated when depreciation is posted.';
            Visible = True;
        }
        modify("Allocated Write-Down %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage for write-down transactions that can be allocated when write-down transactions are posted.';
            Visible = True;
        }
        modify("Allocated Appreciation %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage for appreciation transactions that can be allocated when appreciation transactions are posted.';
            Visible = True;
        }
        modify("Allocated Custom 1 %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage for custom-1 transactions that can be allocated when custom-1 transactions are posted.';
            Visible = True;
        }
        modify("Allocated Custom 2 %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage for custom-2 transactions that can be allocated when custom-2 transactions are posted.';
            Visible = True;
        }
        modify("Allocated Sales Price %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage of sales price that can be allocated when sales are posted.';
            Visible = True;
        }
        modify("Allocated Maintenance %")
        {
            ApplicationArea = FixedAssets;
            ToolTip = 'Specifies the total percentage for maintenance transactions that can be allocated when maintenance transactions are posted.';
            Visible = True;
        }

    }

    actions
    {
        // Add changes to page actions here
    }
}