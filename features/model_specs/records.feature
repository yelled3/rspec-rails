Feature: records

  Scenario: with a matching number of records
    Given a file named "spec/models/widget_spec.rb" with:
    """ruby
    require "spec_helper"

    describe Widget do
      it "verifies that there are no widgets in the database" do
        expect(Widget).to have(0).records
        expect(Widget).to have(:no).records
      end

      it "verifies that there are widgets in the database" do
        Widget.create!(name: "Spanner")

        expect(Widget).to have(1).record
      end
    end
    """
    When I run `rspec spec/models/widget_spec.rb`
    Then the examples should all pass
