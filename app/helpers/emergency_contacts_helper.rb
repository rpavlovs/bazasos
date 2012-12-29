module EmergencyContactsHelper
  def options_for_priority
    [
      [t('emergency_contacts.priority.1'), 1],
      [t('emergency_contacts.priority.2'), 2],
      [t('emergency_contacts.priority.3'), 3]
    ]
  end

  def priority_to_text(priority)
    t("emergency_contacts.priority.#{priority}")
  end
end
