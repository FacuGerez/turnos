require "application_system_test_case"

class EventosTest < ApplicationSystemTestCase
  setup do
    @evento = eventos(:one)
  end

  test "visiting the index" do
    visit eventos_url
    assert_selector "h1", text: "Eventos"
  end

  test "should create evento" do
    visit eventos_url
    click_on "New evento"

    fill_in "Description", with: @evento.description
    fill_in "End time", with: @evento.end_time
    fill_in "Eventname", with: @evento.eventName
    fill_in "Start time", with: @evento.start_time
    click_on "Create Evento"

    assert_text "Evento was successfully created"
    click_on "Back"
  end

  test "should update Evento" do
    visit evento_url(@evento)
    click_on "Edit this evento", match: :first

    fill_in "Description", with: @evento.description
    fill_in "End time", with: @evento.end_time
    fill_in "Eventname", with: @evento.eventName
    fill_in "Start time", with: @evento.start_time
    click_on "Update Evento"

    assert_text "Evento was successfully updated"
    click_on "Back"
  end

  test "should destroy Evento" do
    visit evento_url(@evento)
    click_on "Destroy this evento", match: :first

    assert_text "Evento was successfully destroyed"
  end
end
