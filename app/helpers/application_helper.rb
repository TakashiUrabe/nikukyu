module ApplicationHelper
  def default_meta_tags
    {
      site: 'にくきゅう診断',
      title: '実はうちの犬猫の性格は〇〇だった！気になったあなたはクリックして診断しよう！！',
      reverse: true,
      separator: '|',
      description: '「にくきゅう診断」は、犬猫のにくきゅうの写真から性格診断をして、その結果からTwitterヘッダーに設定できるプロフィールカードを作れるサービス。世界にひとつだけのプロフィールカードを作ろう!',
      keywords: 'にくきゅう診断',
      charset: 'UTF-8',
      canonical: 'https://www.nikukyu-shindan.com',
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico'), sizes: '32x32' }
      ],
      og: {
        site_name: 'にくきゅう診断',
        title: '実はうちの犬猫の性格は〇〇だった！気になったあなたはクリックして診断しよう！！',
        description: '「にくきゅう診断」は、犬猫のにくきゅうの写真から性格診断をして、その結果からTwitterヘッダーやInstagramストーリーに使えるプロフィールカードを作れるサービス。世界にひとつだけのプロフィールカードを作ろう!',
        type: 'website',
        url: 'https://www.nikukyu-shindan.com',
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@TUrabe22'
      }
    }
  end
end
