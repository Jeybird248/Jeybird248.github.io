# Replace {{version}} placeholders in third_party_libraries URLs with actual
# version numbers. This runs at site init time so every template that references
# site.third_party_libraries.X.url.Y gets the resolved CDN URL.

Jekyll::Hooks.register :site, :after_init do |site|
  next unless site.config['third_party_libraries']

  site.config['third_party_libraries'].each do |key, value|
    next if key == 'download'
    next unless value.is_a?(Hash) && value['url'] && value['version']

    value['url'].each do |type, url|
      if url.is_a?(Hash)
        url.each do |type2, url2|
          if url2.is_a?(String) && url2.include?('{{version}}')
            site.config['third_party_libraries'][key]['url'][type][type2] =
              url2.gsub('{{version}}', value['version'])
          end
        end
      elsif url.is_a?(String) && url.include?('{{version}}')
        site.config['third_party_libraries'][key]['url'][type] =
          url.gsub('{{version}}', value['version'])
      end
    end
  end
end
