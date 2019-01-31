module ContributionsHelper
  def contribution_choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_contributions_path
    elsif action_name == 'edit'
      contribution_path
    end
  end
end
