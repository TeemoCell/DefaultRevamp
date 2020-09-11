<div class="ui fluid card" id="widget-latest-posts">
    <div class="content">
        <h4 class="ui header">{$SERVER_STATUS}</h4>
        <div class="description">
            {if isset($SERVER)}
                    <div class="ui relaxed">
                        <div class="content">
                            {if $SERVER.status_value eq 1}
                                <span class="ui label large green">{$ONLINE}
                            {else}
                                <span class="ui label large red">{$OFFLINE}
                            {/if}
                                    <div class="detail">{$SERVER.name}</div>
                                </span>

                            {if $SERVER.status_value eq 1}
                                <div class="ui divider"></div>                                
                                <p>{$ONLINE}: <strong>{$SERVER.player_count} / {$SERVER.player_count_max}</strong></p>
                                <p>{$VERSION}</p>
                                <p>{$IP}: <strong>{$SERVER.join_at}</strong></p>
                            {/if}
                        </div>
                    </div>
            {else}
                {$NO_SERVERS}
            {/if}
        </div>
    </div>
</div>