page 80207 "Outcomes Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Outcomes Subform";

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
                field("Output Description"; Rec."Output Description")
                {
                    ToolTip = 'Specifies the value of the Output Description field.', Comment = '%';
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenOutputsCard)
            {
                ApplicationArea = All;
                Caption = 'Go to Output Card';
                Image = List;


                trigger OnAction()
                var
                    OutputRec: Record "Output Header";
                begin
                    OutputRec.SetRange("Output Code", Rec."Output Code");
                    PAGE.Run(PAGE::"Outputs Card", OutputRec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}