module FilepickerRails
  # @private
  class Engine < ::Rails::Engine
    config.filepicker_rails = FilepickerRails::Configuration.new
    isolate_namespace FilepickerRails

    initializer 'filepicker_rails.form_builder' do
      Rails.application.reloader.to_prepare do
        ActionView::Helpers::FormBuilder.send(:include, FilepickerRails::FormHelper)
      end
    end

    initializer 'filepicker_rails.action_controller' do |app|
      Rails.application.reloader.to_prepare do
        ActiveSupport.on_load(:action_controller) do
          helper FilepickerRails::ApplicationHelper
        end
      end
    end
  end
end
