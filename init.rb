Redmine::Plugin.register :ref_issue do
  name 'Ref Issue plugin'
  author 'Mitsuaki Kuwahara'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Redmine::WikiFormatting::Macros.register do
  desc "get issue value" 

  macro :issue_assigned_lastname do |obj, args|
    if (args.size != 1)
      raise "usage: issue_assigned_lastname({issue-no})"
    end

    issue_id = args.first.strip
    issue = Issue.find_by_id(issue_id)
    unless issue
      return "(" + issue_id + "?)"
    end

    unless issue.assigned_to_id
      return "-"
    end

    user = User.find(issue.assigned_to_id)
    return user.lastname
  end

  macro :issue_status do |obj, args|
    if (args.size != 1)
      raise "usage: issue_status({issue-no})"
    end
    issue_id = args.first.strip
    issue = Issue.find_by_id(issue_id)
    unless issue
      return "(" + issue_id + "?)"
    end
    stat = IssueStatus.find(issue.status_id)
    return stat.name
  end

  macro :issue_created_on_date do |obj, args|
    if (args.size != 1)
      raise "usage: issue_created_on_date({issue-no})"
    end
    issue_id = args.first.strip
    issue = Issue.find_by_id(issue_id)
    unless issue
      return "(" + issue_id + "?)"
    end
    return issue.created_on.to_date
  end

  macro :issue_updated_on_date do |obj, args|
    if (args.size != 1)
      raise "usage: issue_updated_on_date({issue-no})"
    end
    issue_id = args.first.strip
    issue = Issue.find_by_id(issue_id)
    unless issue
      return "(" + issue_id + "?)"
    end
    return issue.updated_on.to_date
  end

end
