require 'test_helper'
require 'application_system_test_case'
class AdminWorkflowTest < ApplicationSystemTestCase
  def setup
    @admin = create(:user, :admin)
    admin_login
  end
  test "admin autorisation" do
    assert_current_path "/admin_dashboard"
  end

  test "admin dashboard show" do
    assert page.has_content?("Добавить книги в базу данных"), "Нет надписи 'Добавить книги в базу данных'"
    assert page.has_content?("Посмотреть книги из базы данных"), "Нет надписи 'Посмотреть книги из базы данных'"
    assert page.has_content?("Выйти из аккаунта"), "Нет надписи 'Выйти из аккаунта'"
  end

  test "adding book and showing all books" do
    add_book

    assert_current_path "/admin_dashboard"

    click_on "Посмотреть книги из базы данных"
    assert_current_path "/admin_dashboard/all_books"

    assert page.has_content?("book")
    assert page.has_content?("author")
    assert page.has_content?("100")

    click_on "Добавить новую книгу"
    assert_current_path "/admin_dashboard/new_book"

    add_book

    assert_current_path "/admin_dashboard"

    click_on "Посмотреть книги из базы данных"
    assert_current_path "/admin_dashboard/all_books"

    assert page.has_content?("book")
    assert page.has_content?("author")
    assert_not page.has_content?("100")
    assert page.has_content?("200")
  end

  test "giving out and taking back books" do
    register_user

    admin_login

    visit "admin_dashboard/new_book"
    @book1 = create(:book)
    fill_in "Название", with: @book1.name
    fill_in "Автор", with: @book1.author
    fill_in "Количество", with: @book1.count
    click_on "Добавить книгу"


    assert_current_path "/admin_dashboard"
    visit "admin_dashboard/all_books"
    assert_current_path "/admin_dashboard/all_books"

    click_on "Выдать"
    assert_current_path "/admin_dashboard/give_out_book/" + @book1.id.to_s

    fill_in "Email", with: "test@example.com"
    click_on "Выдать"
    assert_current_path "/admin_dashboard/all_books"
  end

  private
  def admin_login
    visit "/login"
    fill_in "Электронная почта", with: @admin.email
    fill_in "Пароль", with: "123456"
    click_on "Войти"
  end

  def add_book
    visit "admin_dashboard/new_book"
    @book = build(:book)
    fill_in "Название", with: @book.name
    fill_in "Автор", with: @book.author
    fill_in "Количество", with: @book.count
    click_on "Добавить книгу"
  end

  def register_user
    visit "/register"
    fill_in "Логин", with: "testUser"
    fill_in "Почта",  with: "test@example.com"
    fill_in "Пароль", with: "123456"
    fill_in "Подтверждение пароля", with: "123456"
    click_on "Зарегистрироваться"
  end
end
