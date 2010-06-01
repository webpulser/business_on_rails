#require File.join(Rails.plugins[:forgeos_core].directory,'lib','forgeos','admin_menu')

Forgeos::AdminMenu <<
{
  :title => 'back_office.menu.sites',
  :url => { :controller => 'admin/sites' },
  :i18n => true,
  :html => { :class => 'left'}
}
