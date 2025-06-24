page 80215 "Strategic Actions List"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategic Actions Header";
    CardPageId = "Strategic Actions Card";

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
                    visible = false;
                }
                field("Strategy Description"; Rec."Strategy Description")
                {
                    ToolTip = 'Specifies the value of the Strategy Description field.', Comment = '%';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ToolTip = 'Specifies the value of the Output Code field.', Comment = '%';
                    visible = false;
                }
                field("Output Description"; Rec."Output Description")
                {
                    ToolTip = 'Specifies the value of the Output Description field.', Comment = '%';
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';
                    visible = false;
                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field("Strategic Objective Code"; Rec."Strategic Objective Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective Code field.', Comment = '%';
                    visible = false;
                }
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';
                    visible = false;
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
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