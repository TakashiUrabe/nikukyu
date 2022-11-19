module ApplicationHelper
  def default_meta_tags
    {
      site: 'にくきゅう診断',
      title: '犬猫のにくきゅうの写真から性格診断ができるサービス',
      reverse: true,
      separator: '|',
      description: '「にくきゅう診断」は、犬猫のにくきゅうの写真から性格診断をして、その結果からTwitterヘッダーに設定できるプロフィールカードを作れるサービス。世界にひとつだけのプロフィールカードを作ろう!',
      keywords: 'にくきゅう診断',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico'), sizes: '32x32' },
      ],
      og: {
        site_name: 'にくきゅう診断',
        title: '犬猫のにくきゅうの写真から性格診断ができるサービス',
        description: '「にくきゅう診断」は、犬猫のにくきゅうの写真から性格診断をして、その結果からTwitterヘッダーに設定できるプロフィールカードを作れるサービス。世界にひとつだけのプロフィールカードを作ろう!',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@TUrabe22',
      },
    }
  end
end
