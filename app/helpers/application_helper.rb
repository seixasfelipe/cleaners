module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def navigation_links
    links = []

    options = params[:controller] == "home" ? { class: "active" } : {}
    links << content_tag(:li, link_to("Inicio", home_path), options).html_safe

    options = params[:controller] == "tasks" ? { class: "active" } : {}
    links << task_dropdown_menu(options).html_safe

    options = params[:controller] == "customers" ? { class: "active" } : {}
    links << customer_dropdown_menu(options).html_safe

    content_tag(:ul, links.join("\n").html_safe, class: "nav")
  end

  private

  def task_dropdown_menu(options = {})
    option = options[:class] unless options.empty?
    content_tag(:li, class: "dropdown #{option}") do
      concat(
        content_tag(:a, href: "#", class: "dropdown-toggle", :"data-toggle" => "dropdown") do
          output =  "Servicos <b class='caret'></b>"
          output.html_safe
        end
      )
      concat(
        content_tag(:ul, class: "dropdown-menu") do
          concat(content_tag(:li, link_to("Novo", new_task_path)).html_safe)
          concat(content_tag(:li, link_to("Listar Tarefas", tasks_path)).html_safe)
        end
      )
    end
  end

  def customer_dropdown_menu(options = {})
    option = options[:class] unless options.empty?
    content_tag(:li, class: "dropdown #{option}") do
      concat(
        content_tag(:a, href: "#", class: "dropdown-toggle", :"data-toggle" => "dropdown") do
          output =  "Clientes <b class='caret'></b>"
          output.html_safe
        end
      )
      concat(
        content_tag(:ul, class: "dropdown-menu") do
          concat(content_tag(:li, link_to("Novo", new_customer_path)).html_safe)
          concat(content_tag(:li, link_to("Listar Clientes", customers_path)).html_safe)
        end
      )
    end
  end
end
