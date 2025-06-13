namespace Strategies.Strategies;

page 80202 "Strategic Objectives"
{
    ApplicationArea = All;
    Caption = 'Strategic Objectives';
    PageType = List;
    SourceTable = "Strategic Objective Header";
    UsageCategory = Administration;
    CardPageId = "Strategic Objective Card";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Strategic Objective Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';


                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                    Editable = false;
                }

            }

        }
    }
}
