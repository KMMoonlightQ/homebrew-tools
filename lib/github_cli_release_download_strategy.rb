require "download_strategy"

# Keep private release credentials inside gh; no token is stored in the Formula.
class KmmGitHubReleaseDownloadStrategy < CurlDownloadStrategy
  private

  # Private release URLs cannot be probed with an anonymous HTTP request.
  def resolve_url_basename_time_file_size(url, timeout: nil)
    [url, File.basename(URI(url).path), nil, nil, "application/octet-stream", false]
  end

  def _fetch(url:, resolved_url:, timeout: nil)
    match = url.match(%r{\Ahttps://github\.com/([^/]+/[^/]+)/releases/download/([^/]+)/([^/]+)\z})
    raise CurlDownloadStrategyError.new(url, "Expected a GitHub Release asset URL") unless match

    gh = HOMEBREW_PREFIX/"bin/gh"
    unless gh.executable?
      raise CurlDownloadStrategyError.new(url, "Run `brew install gh` and `gh auth login` before installing")
    end

    repository, tag, asset = match.captures
    temporary_path.dirname.mkpath
    command!(
      gh.to_s,
      args: ["release", "download", tag, "--repo", repository,
             "--pattern", asset, "--output", temporary_path.to_s, "--clobber"],
      env: { "GH_PROMPT_DISABLED" => "1", "GH_PAGER" => "cat", "GH_DEBUG" => "" },
      timeout: timeout,
    )
  end
end
