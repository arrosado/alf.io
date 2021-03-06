--
-- This file is part of alf.io.
--
-- alf.io is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- alf.io is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with alf.io.  If not, see <http://www.gnu.org/licenses/>.
--

drop table additional_service_description;
delete from additional_service_item;
delete from additional_service;

create table additional_service_description (
    id integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
    additional_service_id_fk integer not null,
    locale varchar(8) not null,
    type varchar(16) not null,
    value varchar(2048) not null
);

alter table additional_service_description add FOREIGN KEY asd_as_id_fk (additional_service_id_fk) REFERENCES additional_service(id);
alter table additional_service_description add constraint unique_asd unique(additional_service_id_fk, locale, type);
