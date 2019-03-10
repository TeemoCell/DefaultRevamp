<div class="ui vertical inverted sidebar menu left" id="toc">
  <div class="item">
    <h3>{$SITE_NAME}</h3>
  </div>
  {foreach from=$NAV_LINKS key=name item=item}
    {if isset($item.items)}
      <div class="ui pointing dropdown link item">
        <span class="text">{$item.icon} {$item.title}</span> <i class="dropdown icon"></i>
        <div class="menu">
          <div class="header">{$item.title}</div>
          {foreach from=$item.items item=dropdown}
            <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
          {/foreach}
        </div>
      </div>
    {else}
      <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
    {/if}
  {/foreach}
</div>

<div class="pusher">
  <div id="wrapper">
  
    <div class="ui secondary small menu" id="navbar">
      <div class="ui container">
        {foreach from=$NAV_LINKS key=name item=item}
          {if isset($item.items)}
            <div class="ui pointing dropdown link item">
              <span class="text">{$item.icon} {$item.title}</span> <i class="dropdown icon"></i>
              <div class="menu">
                <div class="header">{$item.title}</div>
                {foreach from=$item.items item=dropdown}
                  {if isset($dropdown.seperator)}
                    <div class="divider"></div>
                  {else}
                    <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
                  {/if}
                {/foreach}
              </div>
            </div>
          {else}
            <a class="item{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
          {/if}
        {/foreach}
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
        <div class="right menu">
          {foreach from=$USER_SECTION key=name item=item}
            {if isset($item.items)}
              {if ($name == "alerts") || ($name == "pms")}
                <a class="ui small default icon button" data-toggle="popup" data-position="bottom right" id="button-{$name}">{$item.icon}</a>
                <div class="ui wide basic popup">
                  <h4 class="ui header">{$item.title}</h4>
                  <div class="ui relaxed link list" id="list-{$name}">
                    <a class="item">{$LOADING}</a>
                  </div>
                  <div class="ui link list">
                    <div class="ui divider"></div>
                    <a class="item" href="{$item.link}">{$item.meta}</a>
                  </div>
                </div>
              {elseif ($name == "account")}
                <a class="ui medium image label" data-toggle="popup" data-position="bottom right" id="button-{$name}">
                  <img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}"> {$LOGGED_IN_USER.username}
                </a>
                <div class="ui wide basic popup">
                  <h4 class="ui header">{$item.title}</h4>
                  <div class="ui relaxed link list" id="list-{$name}">
                    {foreach from=$item.items item=dropdown}
                      {if isset($dropdown.seperator)}
                          <div class="ui divider"></div>
                      {else}
                        <a class="item" href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
                      {/if}
                    {/foreach}
                  </div>
                </div>
              {/if}
            {else}
              {if ($name == "panel")}
                <a class="ui small primary icon button" href="{$item.link}" target="{$item.target}">{$item.icon}</a>
              {elseif ($name == "register")}
                <a class="ui small primary button" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
              {else}
                <a class="ui small default button" href="{$item.link}" target="{$item.target}">{$item.icon} {$item.title}</a>
              {/if}
            {/if}
          {/foreach}
        </div>
      </div>
    </div>

    <div class="ui masthead"{if isset($BANNER_IMAGE)} style="background-image:url('{$BANNER_IMAGE}')"{/if}>
      <div class="ui container">
        <div class="ui stackable grid">
          <div class="ui middle aligned row">
            <div class="eight wide column">
              <h1>{$SITE_NAME}</h1>
            </div>
            <div class="eight wide column">
              {if isset($MINECRAFT) && isset($SERVER_QUERY)}
                <div class="connect-server">
                  {if isset($SERVER_QUERY)}
                    {if isset($SERVER_QUERY.status_value) && $SERVER_QUERY.status_value == 1}
                      {if isset($SERVER_QUERY.status_full)}
                        <h4 class="ui header">{$SERVER_QUERY.status_full}</h4>
                      {else}
                        <h4 class="ui header">{$SERVER_QUERY.x_players_online}</h4>
                      {/if}
                    {else}
                      <h4 class="ui header">{$SERVER_OFFLINE}</h4>
                    {/if}
                  {/if}
                  {if isset($CLICK_TO_COPY_TOOLTIP)}
                    <h4 class="ui header">
                      <span onclick="copy('#ip')" data-tooltip="{$CLICK_TO_COPY_TOOLTIP}" data-variation="mini" data-inverted="" data-position="bottom center">{$CONNECT_WITH}</span>
                    </h4>
                  {/if}
                </div>
              {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
    
  <div class="ui container">

    {if isset($NEW_UPDATE)}
      {if $NEW_UPDATE_URGENT eq true}
        <div class="ui negative icon message" id="update-message">
      {else}
        <div class="ui info icon message" id="update-message">
          <i class="close icon"></i>
      {/if}
      <a href="{$UPDATE_LINK}">
        <i class="download icon"></i>
      </a>
        <div class="content">
          <div class="header">{$NEW_UPDATE}</div>
          <ul class="list">
            <li>{$CURRENT_VERSION}</li>
            <li>{$NEW_VERSION}</li>
          </ul>
        </div>
      </div>
    {/if}
