select * from PortfolioProject..covidDeaths
order by 3,4

--select * from PortfolioProject..CovidVaccinations
--order by 3,4

--select data that we are going to use 

Select location,date,total_cases,new_cases,total_deaths
from PortfolioProject..CovidDeaths
order by 1,2

--looking at total cases vs Total Deaths

Select location,date,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

--looking at total cases vs population
--shows what percentage of population get covid 

Select location,date,population,total_cases,(total_cases/population)*100 as DeathPercentage 
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

--looking at countries with highest infection rate compared to population


Select location,population,date,MAX(total_cases) as HighestInfectionCount,MAX(total_cases/population) *100 as 
PercentagePopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%states%'
group by location,population,date
order by PercentagePopulationInfected DESC

--showing countries with the highest death count per population

Select location,MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not  null 
group by location
order by  TotalDeathCount DESC

--Let's break things down by continent
--showing continents with the highest death count per population

Select continent,MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
group by continent  
order by  TotalDeathCount DESC

--Global numbers 

Select date,SUM(new_cases) as total_cases,SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/SUM(new_cases)*100 
as DeathPercentage 
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not null
group by date
order by 1,2

--looking at Total population vs Vaccinations,
select dea.continent,dea.location,dea.date ,dea.population,vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER(partition by  dea.location,dea.date)
as RollingPeopleVaccinations
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3

--use CTE

with PopvsVac(continent,location,date,population,new_vaccination,RollingPeopleVaccinated)
as
(
select dea.continent,dea.location,dea.date ,dea.population,vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER(partition by  dea.location,dea.date)
as RollingPeopleVaccinations
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3
)
select *,(RollingPeopleVaccinated/population)*100
from PopvsVac

--TEMP TABLE
drop table if exists #Percentgepopultionvaccinated
create table #PercentgePopultionVaccinated
(
continent nvarchar(255),
Location nvarchar(255),
Date datetime,
population numeric,
New_vacccinations numeric,
RollingPeoplevaccinated numeric
)

insert into #PercentgePopultionVaccinated
select dea.continent,dea.location,dea.date ,dea.population,vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER(partition by  dea.location,dea.date)
as RollingPeopleVaccinations
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3

select *,(RollingPeopleVaccinated/population)*100
from #PercentgePopultionVaccinated

--creating view to store data for later visualization
create view PercentgePopultionVaccinated as 
select dea.continent,dea.location,dea.date ,dea.population,vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER(partition by  dea.location,dea.date)
as RollingPeopleVaccinations
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3

select * from 
PercentgePopultionVaccinated

