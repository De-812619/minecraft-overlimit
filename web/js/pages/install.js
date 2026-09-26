import { note, table, toc } from "../ui.js";

export const install = {
  path: "/install",
  title: "導入方法",
  group: "はじめに",
  nav: "導入",
  html: `
    <p class="kicker">Setup</p>
    <h1>導入方法</h1>
    <p class="lead">配布物はビルド済みの Fabric JAR です。GitHub の Source ZIP を <code>mods/</code> に置いても動きません。</p>
    ${toc([
      ["need", "必要環境"],
      ["single", "シングルプレイ"],
      ["multi", "マルチプレイ"],
      ["dnt", "Dungeons and Taverns"],
      ["after", "入れたあとに知っておくこと"],
      ["files", "配布ファイル"],
    ])}
    <h2 id="need">必要環境</h2>
    ${table(
      ["項目", "バージョン"],
      [
        ["Minecraft", "Java Edition 26.2"],
        ["Mod ローダー", "Fabric Loader 0.19.3"],
        ["ライブラリ", "Fabric API 0.156.0+26.2"],
        ["Java", "25"],
        ["任意", "Dungeons and Taverns（Modrinth の datapack。チェストボーナスの対象が増える）"],
      ]
    )}
    <h2 id="single">シングルプレイ</h2>
    <ol>
      <li>Prism などのインスタンスで、Minecraft 26.2 と Fabric、Fabric API を用意します。</li>
      <li><code>overlimit-*.jar</code> を、そのインスタンスの <code>mods/</code> に置きます。同じ Mod ID の古い JAR は外します。</li>
      <li>別の Over Limit リソースパックは有効にしません。JAR 内の <code>assets/</code> がモデル、テクスチャ、翻訳を出します。別パックを同時に有効にすると、同じ見た目が二重に載ります。</li>
      <li>ゲームを起動し、ワールドに入ります。JAR を入れ直したあとは再起動が必要です。</li>
    </ol>
    ${note("ワールドの <code>datapacks/</code> に同じ内容を置かないでください。Mod とデータパックが二重に効きます。")}
    <h2 id="multi">マルチプレイ</h2>
    <p>サーバーだけに Mod を入れる構成です。サーバーは JAR 内の <code>data/</code> を使います。見た目は、Mod の入っていないクライアントには届きません。</p>
    <ol>
      <li>サーバーの <code>mods/</code> に、クライアントと同じ JAR を置きます。</li>
      <li>参加者のクライアントへ、リソースパック <code>over_limit_resources.zip</code> を配ります。<code>resourcepacks/</code> で有効化するか、<code>server.properties</code> の <code>resource-pack</code> で配ります。</li>
      <li>参加者側でパックを適用してから接続します。</li>
    </ol>
    ${note("<strong>リソースパックが無いとき</strong>クラフトアイテム（護符、黄金弓、トーテム、ミニゴーレム、UNLIMITED など）の見た目が欠落テクスチャになります。効果そのものはサーバー側で動きます。", true)}
    <h2 id="dnt">Dungeons and Taverns</h2>
    <p>併用は任意です。入れている場合、DnT のチェスト系ルート（主に名前空間 <code>nova_structures</code>。一部は <code>minecraft</code> の上書き）にも、バニラと同じ追加プールが入ります。地図（charts）と考古学ルートは対象外です。</p>
    <p>本 Mod は DnT のルートを上書きします。ワールドの datapacks の並びでは、<strong>本パックを DnT より後</strong>に読んでください。Mod として入れる場合は、データパックの読み込み順が DnT のあとに本 Mod になるようにします。</p>
    <h2 id="after">入れたあとに知っておくこと</h2>
    <ul>
      <li><strong>既存チェストは変わらない。</strong>中身が確定したチェストには追加が入りません。新しく生成されるチェストだけです。すでに探索済みの構造物を取り直したい場合は、未生成のチャンクへ行くか、新しいワールドを使います。</li>
      <li><strong>ディメンション追加は再起動が要る。</strong>ブラッドワールドは <code>/reload</code> では足りません。タイトルへ戻ってワールドに入り直します。実験的設定の確認が出ることがあります。</li>
      <li><strong>霧の World Clock も初回は再起動。</strong>ブラッドムーンの赤い霧はカスタム時計です。<code>/reload</code> だけでは登録されないことがあります。</li>
      <li><strong>既存の装備個体は更新されない。</strong>コンポーネントを変えた JAR に差し替えても、すでに持っている UNLIMITED などは古いままです。付け直しが必要です。</li>
      <li>平和（Peaceful）では、イベントは始まりません。開始後に平和へ変えると、そのイベントは罰なしで無効終了します（ネザー化もしません）。</li>
    </ul>
    <h2 id="files">配布ファイル</h2>
    ${table(
      ["ファイル", "置く場所", "中身"],
      [
        ["<code>overlimit-*.jar</code>", "クライアントまたはサーバーの <code>mods/</code>", "データパック、Java、クライアント資産"],
        ["<code>over_limit_resources.zip</code>", "クライアントの <code>resourcepacks/</code>", "サーバーだけに Mod があるときの見た目"],
      ]
    )}
    <p>シングルで JAR の見た目を使うときは、リソースパック側は外したままにします。</p>
  `,
};
