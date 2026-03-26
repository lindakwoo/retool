const environment = {{ retoolContext.environment }}

if (environment === 'staging') {
  return 'ft_staging_analytics';
}
return 'ft_prod_analytics';