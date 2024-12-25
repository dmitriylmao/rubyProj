require 'test_helper'
require 'application_system_test_case'

class UserWorkflowTest < ApplicationSystemTestCase
  def setup
    @user = create(:user)
  end

  # registration
  test "registration show" do
    visit "/register"
    assert page.has_content?("Регистрация"), "Нет надписи 'Регистрация'"
    assert page.has_content?("Войти"), "Нет надписи 'Войти'"
  end

  test "successful registration" do
    register_user

    assert_current_path "/user_dashboard"

    assert page.has_content?("Взятые книги"), "Нет надписи 'Взятые книги'"
    assert page.has_content?("Каталог книг"), "Нет надписи 'Каталог книг'"
    assert page.has_content?("История"), "Нет надписи 'История'"
    assert page.has_content?("Выход из аккаунта"), "Нет надписи 'Выход из аккаунта'"


  end

  test "successful login" do
    register_user
    assert_current_path "/user_dashboard"

    click_on "Выход из аккаунта"
    assert_current_path "/"

    click_on "Регистрация"
    assert_current_path "/register"

    click_on "Войти"
    assert_current_path "/login"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    click_on "Войти"
    assert_current_path "/user_dashboard"
  end

  private
  def register_user
    visit "/register"
    fill_in "Username", with: "testUser"
    fill_in "Email",  with: "test@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Зарегистрироваться"
  end

end
