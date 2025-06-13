page 80206 "Outcomes List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Outcomes Header";
    CardPageId = "Outcomes Card";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';
                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field("Strategic Objective Code"; Rec."Strategic Objective Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective Code field.', Comment = '%';
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