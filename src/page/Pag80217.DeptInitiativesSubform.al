page 80217 "Dept Initiatives Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DeptInitiatives Subform";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Dept Initiative Code"; Rec."Dept Initiative Code")
                {
                    ToolTip = 'Specifies the value of the Dept Initiative Code field.', Comment = '%';
                }
                field("Dept Initiative"; Rec."Dept Initiative")
                {
                    ToolTip = 'Specifies the value of the Dept Initiative field.', Comment = '%';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}