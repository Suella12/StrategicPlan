namespace DefaultPublisher;

using Microsoft.Sales.Customer;

pageextension 80200 "Customer List Ext" extends "Customer List"
{
    actions
    {
        addLast(Prompting)
        {
            action(SuggestCustomer)
            {
                Caption = 'Request Copilot';
                Image = Sparkle;
                ApplicationArea = All;

                trigger OnAction()
                var
                    RequestwithCopilot: Page "Request with Copilot";
                begin
                    RequestwithCopilot.Run();
                end;
            }
        }
    }
}