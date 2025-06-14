page 80209 "Outputs Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Output Subform";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Output Code"; Rec."Output Code")
                {
                    ToolTip = 'Specifies the value of the Output Code field.', Comment = '%';
                }
                field("Strategy Code"; Rec."Strategy Code")
                {
                    ToolTip = 'Specifies the value of the Strategy Code field.', Comment = '%';
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
            action(OpenStrategiesCard)
            {
                ApplicationArea = All;
                Caption = 'Go to Strategies Card';
                Image = Card;

                trigger OnAction()
                var
                    StrategyRec: Record "Strategies Header";
                begin
                    StrategyRec.setrange("Strategy Code", Rec."Strategy Code");
                    PAGE.Run(Page::"Strategies Card", StrategyRec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}