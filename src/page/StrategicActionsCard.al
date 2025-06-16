page 80216 "Strategic Actions Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategic Actions Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Strategic Actions Code"; Rec."Strategic Actions Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Actions Code field.', Comment = '%';
                }
                field("Strategic Actions Description"; Rec."Strategic Actions Description")
                {
                    ToolTip = 'Specifies the value of the Strategic Actions Description field.', Comment = '%';
                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field("Output Description"; Rec."Output Description")
                {
                    ToolTip = 'Specifies the value of the Output Description field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                }
                field("Strategy Description"; Rec."Strategy Description")
                {
                    ToolTip = 'Specifies the value of the Strategy Description field.', Comment = '%';
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