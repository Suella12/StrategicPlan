page 80213 "Strategies Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategies Subform";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Strategic Actions Code"; Rec."Strategic Actions Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Actions Code field.', Comment = '%';
                }
                field("Strategic Actions Description"; Rec."Strategic Actions Description")
                {
                    ToolTip = 'Specifies the value of the Strategic Actions Description field.', Comment = '%';
                }
                field("Strategy Code"; Rec."Strategy Code")
                {
                    ToolTip = 'Specifies the value of the Strategy Code field.', Comment = '%';
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