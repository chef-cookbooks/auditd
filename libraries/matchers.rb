if defined?(ChefSpec)
  def create_auditd_builtins(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:auditd_builtins, :create, resource_name)
  end

  def create_auditd_ruleset(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:auditd_ruleset, :create, resource_name)
  end
end
